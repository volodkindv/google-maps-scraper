'''
Love It? Star It! ⭐ https://github.com/omkarcloud/google-maps-scraper/
'''
import os
number_of_scrapers = int(os.getenv("SCRAPER_WORKERS_COUNT", 4))
print(f"working with {number_of_scrapers} workers")