

const openEditAccount = () =>{
  document.getElementById("account-view").classList.add("hidden");
  document.getElementById("account-edit").classList.remove("hidden");
}
const openCancelAccountEdit = () =>{
  document.getElementById("account-edit").classList.add("hidden");
  document.getElementById("account-view").classList.remove("hidden");
}

export{openEditAccount}
export{openCancelAccountEdit}
