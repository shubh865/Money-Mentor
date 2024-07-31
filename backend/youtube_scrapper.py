from flask import Flask, render_template, request, jsonify
from youtubesearchpython import VideosSearch
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/search', methods=['POST'])
def search():
    topic = request.form['topic']
    max_results = 10  # Maximum number of video links to retrieve
    videos_info = scrape_youtube_videos(topic, max_results)
    return jsonify(videos_info)

def scrape_youtube_videos(topic, max_results=10):
    videos = VideosSearch(topic, limit=max_results)
    videos_info = []

    # Extract video info (title, description, link)
    for video in videos.result()['result']:
        video_info = {
            'title': video['title'],           
            'link': video['link'],
        }
        videos_info.append(video_info)

    return videos_info

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
