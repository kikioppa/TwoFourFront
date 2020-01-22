function setDate(form, year, month, day) {

  var current, year, month, day, days, i, j;
  current = new Date();
  year = (year) ? year : current.getFullYear();
  for (i = 0, j = year - 1; i < 5; i++, j++) form.year.options[i] = new Option(j, j);
  month = (month) ? month : current.getMonth() + 1;
  form.month.options[0] = new Option('없음', null);
  for (i = 1; i <= 12; i++) {
    j = (i <= 9) ? '0' + i : i;
    form.month.options[i] = new Option(j, i);

  }
  day = (day) ? day : current.getDate();
  days = new Date(new Date(year, month, 1) - 86400000).getDate();
  form.day.length = 0;
  form.day.options[0] = new Option('없음', null);
  if (month != 'null') {
    for (i = 1, j; i <= days; i++) {
      j = (i <= 9) ? '0' + i : i;
      form.day.options[i] = new Option(j, j);
    }
  }
  form.year.value = year;
  form.month.options[month].selected = true;
  form.day.options[day].selected = true;
}