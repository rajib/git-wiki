$(document).ready(function() {
  $('#branchName').change(function() {
    window.location = $('#branchName :selected').val();
    return false;
  });
});
