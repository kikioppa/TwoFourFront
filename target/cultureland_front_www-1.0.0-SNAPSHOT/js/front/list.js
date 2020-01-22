$(document).ready(function() {
  // $(".aco").hide();
  // $("ul > li:first-child a").next().show();
  $(".qus").click(function() {
    $(this).next().slideToggle(250);
    // $(this).next().slideDown(300);
    $(".qus").not(this).next().slideUp(250);
    return false;
  });
  $(".qus").eq(0).trigger("click");
});











$(document).ready(function() {
  $(".list1").click(function() {
    if ($(".list1-con").is(":visible")) {
      $(".list1-con").css("display", "block");
      $(".list2-con").css("display", "none");
      $(".list3-con").css("display", "none");
      $(".list4-con").css("display", "none");
      $(".list5-con").css("display", "none");
    } else {
      $(".list1-con").css("display", "block");
      $(".list2-con").css("display", "none");
      $(".list3-con").css("display", "none");
      $(".list4-con").css("display", "none");
      $(".list5-con").css("display", "none");
      $(".list1").css("background-color", "rgb(223, 0, 0)");
      $(".list1 a").css("color", "white");
      $(".list2").css("background-color", "white");
      $(".list2 a").css("color", "black");
      $(".list3").css("background-color", "white");
      $(".list3 a").css("color", "black");
      $(".list4").css("background-color", "white");
      $(".list4 a").css("color", "black");
      $(".list5").css("background-color", "white");
      $(".list5 a").css("color", "black");
    }
  });
});
$(document).ready(function() {
  $(".list2").click(function() {
    if ($(".list2-con").is(":visible")) {
      $(".list2-con").css("display", "block");
      $(".list1-con").css("display", "none");
      $(".list3-con").css("display", "none");
      $(".list4-con").css("display", "none");
      $(".list5-con").css("display", "none");
    } else {
      $(".list2-con").css("display", "block");
      $(".list1-con").css("display", "none");
      $(".list3-con").css("display", "none");
      $(".list4-con").css("display", "none");
      $(".list5-con").css("display", "none");
      $(".list2").css("background-color", "rgb(223, 0, 0)");
      $(".list2 a").css("color", "white");
      $(".list1").css("background-color", "white");
      $(".list1 a").css("color", "black");
      $(".list3").css("background-color", "white");
      $(".list3 a").css("color", "black");
      $(".list4").css("background-color", "white");
      $(".list4 a").css("color", "black");
      $(".list5").css("background-color", "white");
      $(".list5 a").css("color", "black");
    }
  });
});
$(document).ready(function() {
  $(".list3").click(function() {
    if ($(".list3-con").is(":visible")) {
      $(".list3-con").css("display", "block");
      $(".list1-con").css("display", "none");
      $(".list2-con").css("display", "none");
      $(".list4-con").css("display", "none");
      $(".list5-con").css("display", "none");
    } else {
      $(".list3-con").css("display", "block");
      $(".list1-con").css("display", "none");
      $(".list2-con").css("display", "none");
      $(".list4-con").css("display", "none");
      $(".list5-con").css("display", "none");
      $(".list3").css("background-color", "rgb(223, 0, 0)");
      $(".list3 a").css("color", "white");
      $(".list1").css("background-color", "white");
      $(".list1 a").css("color", "black");
      $(".list2").css("background-color", "white");
      $(".list2 a").css("color", "black");
      $(".list4").css("background-color", "white");
      $(".list4 a").css("color", "black");
      $(".list5").css("background-color", "white");
      $(".list5 a").css("color", "black");
    }
  });
});
$(document).ready(function() {
  $(".list4").click(function() {
    if ($(".list4-con").is(":visible")) {
      $(".list4-con").css("display", "block");
      $(".list1-con").css("display", "none");
      $(".list2-con").css("display", "none");
      $(".list3-con").css("display", "none");
      $(".list5-con").css("display", "none");
    } else {
      $(".list4-con").css("display", "block");
      $(".list1-con").css("display", "none");
      $(".list2-con").css("display", "none");
      $(".list3-con").css("display", "none");
      $(".list5-con").css("display", "none");
      $(".list4").css("background-color", "rgb(223, 0, 0)");
      $(".list4 a").css("color", "white");
      $(".list1").css("background-color", "white");
      $(".list1 a").css("color", "black");
      $(".list2").css("background-color", "white");
      $(".list2 a").css("color", "black");
      $(".list3").css("background-color", "white");
      $(".list3 a").css("color", "black");
      $(".list5").css("background-color", "white");
      $(".list5 a").css("color", "black");
    }
  });
});
$(document).ready(function() {
  $(".list5").click(function() {
    if ($(".list5-con").is(":visible")) {
      $(".list5-con").css("display", "block");
      $(".list1-con").css("display", "none");
      $(".list2-con").css("display", "none");
      $(".list3-con").css("display", "none");
      $(".list4-con").css("display", "none");
    } else {
      $(".list5-con").css("display", "block");
      $(".list1-con").css("display", "none");
      $(".list2-con").css("display", "none");
      $(".list3-con").css("display", "none");
      $(".list4-con").css("display", "none");
      $(".list5").css("background-color", "rgb(223, 0, 0)");
      $(".list5 a").css("color", "white");
      $(".list1").css("background-color", "white");
      $(".list1 a").css("color", "black");
      $(".list2").css("background-color", "white");
      $(".list2 a").css("color", "black");
      $(".list3").css("background-color", "white");
      $(".list3 a").css("color", "black");
      $(".list4").css("background-color", "white");
      $(".list4 a").css("color", "black");
    }
  });
});
//paging
$(document).ready(function() {
  $(".num1").click(function() {
    if ($(".num1").is(":visible")) {
      $(".num1").css("background-color", "rgb(223, 0, 0)");
      $(".num1 a").css("color", "white");
      $(".num2").css("background-color", "white");
      $(".num2 a").css("color", "black");
      $(".num3").css("background-color", "white");
      $(".num3 a").css("color", "black");
      $(".num4").css("background-color", "white");
      $(".num4 a").css("color", "black");
      $(".num5").css("background-color", "white");
      $(".num5 a").css("color", "black");
    } else {
      $(".num2").css("background-color", "white");
      $(".num2 a").css("color", "black");
      $(".num3").css("background-color", "white");
      $(".num3 a").css("color", "black");
      $(".num4").css("background-color", "white");
      $(".num4 a").css("color", "black");
      $(".num5").css("background-color", "white");
      $(".num5 a").css("color", "black");
    }
  });
});
$(document).ready(function() {
  $(".num2").click(function() {
    if ($(".num2").is(":visible")) {
      $(".num2").css("background-color", "rgb(223, 0, 0)");
      $(".num2 a").css("color", "white");
      $(".num1").css("background-color", "white");
      $(".num1 a").css("color", "black");
      $(".num3").css("background-color", "white");
      $(".num3 a").css("color", "black");
      $(".num4").css("background-color", "white");
      $(".num4 a").css("color", "black");
      $(".num5").css("background-color", "white");
      $(".num5 a").css("color", "black");
    } else {
      $(".num1").css("background-color", "white");
      $(".num1 a").css("color", "black");
      $(".num3").css("background-color", "white");
      $(".num3 a").css("color", "black");
      $(".num4").css("background-color", "white");
      $(".num4 a").css("color", "black");
      $(".num5").css("background-color", "white");
      $(".num5 a").css("color", "black");
    }
  });
});
$(document).ready(function() {
  $(".num3").click(function() {
    if ($(".num3").is(":visible")) {
      $(".num3").css("background-color", "rgb(223, 0, 0)");
      $(".num3 a").css("color", "white");
      $(".num1").css("background-color", "white");
      $(".num1 a").css("color", "black");
      $(".num2").css("background-color", "white");
      $(".num2 a").css("color", "black");
      $(".num4").css("background-color", "white");
      $(".num4 a").css("color", "black");
      $(".num5").css("background-color", "white");
      $(".num5 a").css("color", "black");
    } else {
      $(".num1").css("background-color", "white");
      $(".num1 a").css("color", "black");
      $(".num2").css("background-color", "white");
      $(".num2 a").css("color", "black");
      $(".num4").css("background-color", "white");
      $(".num4 a").css("color", "black");
      $(".num5").css("background-color", "white");
      $(".num5 a").css("color", "black");
    }
  });
});
$(document).ready(function() {
  $(".num4").click(function() {
    if ($(".num4").is(":visible")) {
      $(".num4").css("background-color", "rgb(223, 0, 0)");
      $(".num4 a").css("color", "white");
      $(".num1").css("background-color", "white");
      $(".num1 a").css("color", "black");
      $(".num2").css("background-color", "white");
      $(".num2 a").css("color", "black");
      $(".num3").css("background-color", "white");
      $(".num3 a").css("color", "black");
      $(".num5").css("background-color", "white");
      $(".num5 a").css("color", "black");
    } else {
      $(".num1").css("background-color", "white");
      $(".num1 a").css("color", "black");
      $(".num2").css("background-color", "white");
      $(".num2 a").css("color", "black");
      $(".num3").css("background-color", "white");
      $(".num3 a").css("color", "black");
      $(".num5").css("background-color", "white");
      $(".num5 a").css("color", "black");
    }
  });
});
$(document).ready(function() {
  $(".num5").click(function() {
    if ($(".num5").is(":visible")) {
      $(".num5").css("background-color", "rgb(223, 0, 0)");
      $(".num5 a").css("color", "white");
      $(".num1").css("background-color", "white");
      $(".num1 a").css("color", "black");
      $(".num2").css("background-color", "white");
      $(".num2 a").css("color", "black");
      $(".num3").css("background-color", "white");
      $(".num3 a").css("color", "black");
      $(".num4").css("background-color", "white");
      $(".num4 a").css("color", "black");
    } else {
      $(".num1").css("background-color", "white");
      $(".num1 a").css("color", "black");
      $(".num2").css("background-color", "white");
      $(".num2 a").css("color", "black");
      $(".num3").css("background-color", "white");
      $(".num3 a").css("color", "black");
      $(".num4").css("background-color", "white");
      $(".num4 a").css("color", "black");
    }
  });
});