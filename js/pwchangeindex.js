function showHidePasswordfn() {
  var showHideBtn = $(this);

  // The second span inside the button.
  var showHideText = showHideBtn.children().eq(1);
  var $pwd = showHideBtn.prev('input');

  // Toggle a class called toggleShowHide to the button.
  $(showHideBtn).toggleClass('toggleShowHide');
  // If the button has the class toggleShowHide change the text of the second span inside it.
  showHideText.text(showHideBtn.is('.toggleShowHide') ? 'Hide' : 'Show');

  if ($pwd.attr('type') === 'password') {
    $pwd.attr('type', 'text');
  } else {
    $pwd.attr('type', 'password');
  }
}

// On Click.
$('.js-showHidePassword').on('click', showHidePasswordfn);

// On Enter Key.
$('.js-showHidePassword').keydown(function(e) {
  // The enter key code.
  if (e.which === 13) {
    showHidePasswordfn.call(this);
  }
});