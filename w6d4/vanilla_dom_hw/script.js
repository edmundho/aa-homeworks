document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    // console.log(li);
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const faveFormEl = document.getElementsByClassName("list-container")[0];
  faveFormEl.addEventListener("submit", event => {
    event.preventDefault();

    const favePlaceInputEl = document.getElementsByClassName("favorite-input")[0];
    const favePlaceName = favePlaceInputEl.value;
    favePlaceInputEl.value = "";

    const sfUl = document.getElementById("sf-places");
    const favePlaceLi = document.createElement("li");
    favePlaceLi.textContent = favePlaceName;
    sfUl.appendChild(favePlaceLi);
  });


  // adding new photos

  // --- your code here!
  const photoShow = document.getElementsByClassName("photo-show-button")[0];
  photoShow.addEventListener("click", event => {
    event.preventDefault();

    const hiddenDiv = document.getElementsByClassName("photo-form-container")[0];
    if (hiddenDiv.classList.value.includes("hidden")) {
      hiddenDiv.classList.remove("hidden");
    } else {
      hiddenDiv.classList.add('hidden');
    }
  });

  const photoAdd = document.getElementsByClassName("photo-url-submit")[0];
  photoAdd.addEventListener("click", event => {
    event.preventDefault();

    const newUrlForm = document.getElementsByClassName("photo-url-input")[0];
    const newPhoto = newUrlForm.value;
    newUrlForm.value = "";

    const dogsUl = document.getElementsByClassName("dog-photos")[0];
    const newPhotoLi = document.createElement("li");
    // console.log(newPhoto);
    const newImg = document.createElement("IMG");
    newImg.setAttribute("src", newPhoto);
    newPhotoLi.appendChild(newImg);
    dogsUl.appendChild(newPhotoLi);
  });
  // })



});
