function titleize(names_array, some_callback) {
  let titleized = names_array.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  some_callback(titleized);
}

titleize(["Mary", "Brian", "Leo"]), (names) => {
  names.forEach(name => console.log(name));
}