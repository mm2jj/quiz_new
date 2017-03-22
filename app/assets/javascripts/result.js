$(document).ready(function () {
    // will call refreshPartial every 3 seconds
    var tenSeconds = 10;
    var display = $('#time');
    startTimer(tenSeconds, display);
});


function startTimer(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.text(minutes + ":" + seconds);

        if (--timer < 0) {
            timer = duration;
            window.location = "/question/result";
        }

    }, 1000);
}