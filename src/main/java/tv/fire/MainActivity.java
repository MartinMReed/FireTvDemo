package tv.fire;

import android.app.Activity;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.widget.VideoView;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main);

        VideoView videoView = (VideoView) findViewById(R.id.videoView);
        videoView.setOnErrorListener(new MediaPlayer.OnErrorListener() {

            @Override
            public boolean onError(MediaPlayer mediaPlayer, int what, int extra) {

                mediaPlayer.release();

                VideoView videoView = (VideoView) findViewById(R.id.videoView);
                videoView.stopPlayback();
                videoView.start();
                return true;
            }
        });
        videoView.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {

            @Override
            public void onCompletion(MediaPlayer mediaPlayer) {

                mediaPlayer.release();

                VideoView videoView = (VideoView) findViewById(R.id.videoView);
                videoView.stopPlayback();
                videoView.start();
            }
        });
        videoView.setVideoPath(getString(R.string.video_url));
        videoView.start();
    }

    @Override
    protected void onPause() {

        super.onPause();

        VideoView videoView = (VideoView) findViewById(R.id.videoView);
        videoView.stopPlayback();

        if (!isFinishing()) {
            finish();
        }
    }
}
