async function filteredProjectGet(req, res) {
  if (Object.keys(req.query).length === 0) {
    return res.redirect("/?category=featured");
  };
  
}
