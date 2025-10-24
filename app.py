"""
夏令时爵士乐队 - 乐谱分享网站
Simple is better than complex.
"""
from flask import Flask, render_template, send_from_directory, abort
import yaml
from pathlib import Path

app = Flask(__name__)

def load_songs():
    """加载曲目数据 - Explicit is better than implicit"""
    try:
        with open('songs.yaml', 'r', encoding='utf-8') as f:
            return yaml.safe_load(f) or {'songs': []}
    except FileNotFoundError:
        return {'songs': []}

@app.route('/')
def index():
    """主页 - 展示所有曲目"""
    data = load_songs()
    return render_template('index.html', songs=data.get('songs', []))

@app.route('/preview/<filename>')
def preview(filename):
    """预览乐谱 - 在网站中显示"""
    score_path = Path('static/scores') / filename
    if not score_path.exists():
        abort(404, description=f"乐谱文件 {filename} 不存在")
    
    # 获取曲目信息用于显示标题
    data = load_songs()
    song_info = None
    for song in data.get('songs', []):
        if song['filename'] == filename:
            song_info = song
            break
    
    return render_template('preview.html', filename=filename, song=song_info)

@app.route('/practice/<filename>')
def practice(filename):
    """练习模式 - 包含节拍器和和弦播放"""
    score_path = Path('static/scores') / filename
    if not score_path.exists():
        abort(404, description=f"乐谱文件 {filename} 不存在")
    
    # 获取曲目信息
    data = load_songs()
    song_info = None
    for song in data.get('songs', []):
        if song['filename'] == filename:
            song_info = song
            break
    
    return render_template('practice.html', filename=filename, song=song_info)

@app.route('/download/<filename>')
def download(filename):
    """下载乐谱 - Errors should never pass silently"""
    score_path = Path('static/scores') / filename
    if not score_path.exists():
        abort(404, description=f"乐谱文件 {filename} 不存在")
    return send_from_directory('static/scores', filename, as_attachment=True)

if __name__ == '__main__':
    import os
    # 生产环境设置 FLASK_ENV=production
    debug = os.environ.get('FLASK_ENV') != 'production'
    app.run(debug=debug, host='0.0.0.0', port=8080)
