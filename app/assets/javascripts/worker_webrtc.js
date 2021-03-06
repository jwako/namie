/**
 * Created by workshop on 2014/06/07.
 */

    // Compatibility shim
navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
var peer;

// Click handlers setup
$(function(){
    // PeerJS object
    peer = new Peer($('#peerId').attr('data-peer-id'), { key: skyway_apikey, debug: 3});

    peer.on('open', function(){
        <!--
      $('#my-id').text(peer.id);
        -->
    });

    // Receiving a call
    peer.on('call', function(call){
        // Answer the call automatically (instead of prompting user) for demo purposes
        call.answer(window.localStream);
        step3(call);
    });
    peer.on('error', function(err){
        alert(err.message);
        // Return to step 2 if error occurs
        step2();
    });

    $('#make-call').click(function(){
        // Initiate a call!
        var call = peer.call($('#peerId').attr('data-peer-target-id'), window.localStream);

        step3(call);
    });

    $('#end-call').click(function(){
        window.existingCall.close();
        step2();
    });

    // Retry if getUserMedia fails
    $('#step1-retry').click(function(){
        $('#step1-error').hide();
        step1();
    });

    // Get things started
    step1();
});

function step1 () {
    // Get audio/video stream
    navigator.getUserMedia({audio: true, video: true}, function(stream){
        // Set your video displays
        $('#w-my-video').prop('src', URL.createObjectURL(stream));

        window.localStream = stream;
        step2();
    }, function(){ $('#step1-error').show(); });
    $('#step2, #step3').hide();
}

function step2 () {
    $('#step1, #step3').hide();
    $('#step2').show();
}

function step3 (call) {
    // Hang up on an existing call if present
    if (window.existingCall) {
        window.existingCall.close();
    }

    // Wait for stream on the call, then set peer video display
    call.on('stream', function(stream){
        $('#w-their-video').prop('src', URL.createObjectURL(stream));
    });

    // UI stuff
    window.existingCall = call;
    $('#their-id').text(call.peer);
    call.on('close', step2);
    $('#step1, #step2').hide();
    $('#step3').show();
}

