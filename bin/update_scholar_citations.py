#!/usr/bin/env python
print("Script started")

import os
import sys
import yaml
import requests
from datetime import datetime


def load_scholar_user_id() -> str:
    config_file = "_data/socials.yml"
    if not os.path.exists(config_file):
        print(f"{config_file} not found.")
        sys.exit(1)

    try:
        with open(config_file, "r") as f:
            config = yaml.safe_load(f)
        scholar_user_id = config.get("scholar_userid")
        if not scholar_user_id:
            print("No 'scholar_userid' found in _data/socials.yml.")
            sys.exit(1)
        return scholar_user_id
    except yaml.YAMLError as e:
        print(f"YAML parse error: {e}")
        sys.exit(1)


SCHOLAR_USER_ID = load_scholar_user_id()
OUTPUT_FILE = "_data/citations.yml"


def fetch_from_serpapi(author_id: str):
    api_key = os.environ.get("SERPAPI_KEY")
    if not api_key:
        print("SERPAPI_KEY not set in environment.")
        return None

    params = {
        "engine": "google_scholar_author",
        "author_id": author_id,
        "api_key": api_key,
    }

    try:
        response = requests.get(
            "https://serpapi.com/search.json",
            params=params,
            timeout=30,
        )
        response.raise_for_status()
        return response.json()
    except Exception as e:
        print(f"SerpAPI request failed: {e}")
        return None


def get_scholar_citations() -> None:
    print(f"Fetching citations for Google Scholar ID: {SCHOLAR_USER_ID}")
    today = datetime.now().strftime("%Y-%m-%d")

    existing_data = None

    if os.path.exists(OUTPUT_FILE):
        try:
            with open(OUTPUT_FILE, "r") as f:
                existing_data = yaml.safe_load(f)
        except Exception:
            pass

    print("Calling SerpAPI...")
    data = fetch_from_serpapi(SCHOLAR_USER_ID)
    print(data)

    if not data:
        print("Failed to retrieve data from SerpAPI. Skipping update.")
        return

    citation_data = {
        "metadata":
            {"last_updated": today},
        "papers": {},
    }

    articles = data.get("articles", [])

    for article in articles:
        try:
            pub_id = article.get("citation_id")
            title = article.get("title", "Unknown Title")
            year = article.get("year", "Unknown Year")
            citations = article.get("cited_by", {}).get("value", 0)

            if not pub_id:
                continue

            print(f"Found: {title} ({year}) - Citations: {citations}")

            citation_data["papers"][pub_id] = {
                "title": title,
                "year": year,
                "citations": citations,
            }

        except Exception as e:
            print(f"Error processing article: {e}")

    if existing_data and existing_data.get("papers") == citation_data["papers"]:
        print("No changes in citation data. Skipping file update.")
        return

    try:
        with open(OUTPUT_FILE, "w") as f:
            yaml.dump(citation_data, f, width=1000, sort_keys=True)
        print(f"Citation data saved to {OUTPUT_FILE}")
    except Exception as e:
        print(f"Error writing citation data: {e}")
        sys.exit(1)


if __name__ == "__main__":
    try:
        get_scholar_citations()
    except Exception as e:
        print(f"Unexpected error: {e}")
        sys.exit(1)