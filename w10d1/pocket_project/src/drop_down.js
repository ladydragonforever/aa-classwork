
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" ,
};

export const dogLinkCreator = function() {
 
  let dArr = Object.keys(dogs);
  let vArr = Object.values(dogs);
  
  for(let i=0; i< dArr.length; i++) {
    let liTag = document.createElement("li");
    liTag.className = "dog-link";
    const dropList = document.getElementsByClassName("drop-down-dog-list");
    const aTag = document.createElement("a");
    aTag.innerHTML = dArr[i];
    aTag.href = vArr[i];
    liTag.appendChild(aTag);
    dropList[0].appendChild(liTag);
  }
 
};

dogLinkCreator();




