import React from "react";
import { createRoot } from "react-dom/client";
// import { EditModal } from "../components/EditModal";


document.addEventListener('DOMContentLoaded', () => {
  const renderReactComponents = () => {
    const editModalContainer = document.getElementById('EditModal');
    if (editModalContainer) {
      const editModalRoot = createRoot(editModalContainer);
      editModalRoot.render(<EditModal />);
    }
  };
  document.addEventListener('turbo:load', renderReactComponents);
});