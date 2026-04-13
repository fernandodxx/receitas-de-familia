// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// Sistema de Favoritos usando sessionStorage
document.addEventListener('DOMContentLoaded', function() {
  // Inicializa o storage de favoritos
  const Favorites = {
    get: function() {
      const stored = sessionStorage.getItem('favorites');
      return stored ? JSON.parse(stored) : [];
    },

    save: function(favorites) {
      sessionStorage.setItem('favorites', JSON.stringify(favorites));
      updateFavoritesCount();
    },

    add: function(recipeId) {
      const favorites = this.get();
      if (!favorites.includes(recipeId)) {
        favorites.push(recipeId);
        this.save(favorites);
      }
    },

    remove: function(recipeId) {
      const favorites = this.get();
      const index = favorites.indexOf(recipeId);
      if (index > -1) {
        favorites.splice(index, 1);
        this.save(favorites);
      }
    },

    isFavorite: function(recipeId) {
      return this.get().includes(recipeId);
    },

    toggle: function(recipeId) {
      if (this.isFavorite(recipeId)) {
        this.remove(recipeId);
        return false;
      } else {
        this.add(recipeId);
        return true;
      }
    }
  };

  // Atualiza o contador de favoritos no header
  function updateFavoritesCount() {
    const countElement = document.getElementById('favorites-count');
    if (countElement) {
      const favorites = Favorites.get();
      countElement.textContent = favorites.length;
    }
  }

  // Configura o botão de favoritar nas páginas de receita
  function setupFavoriteButton() {
    const favoriteBtn = document.getElementById('recipe-favorite-btn');
    if (favoriteBtn) {
      const recipeId = parseInt(favoriteBtn.dataset.recipeId);

      // Atualiza o estado inicial
      updateFavoriteButtonState(favoriteBtn, Favorites.isFavorite(recipeId));

      // Configura o click
      favoriteBtn.addEventListener('click', function(e) {
        e.preventDefault();
        const isNowFavorite = Favorites.toggle(recipeId);
        updateFavoriteButtonState(favoriteBtn, isNowFavorite);
      });
    }
  }

  // Atualiza a aparência do botão de favoritar
  function updateFavoriteButtonState(button, isFavorite) {
    const heartIcon = button.querySelector('.heart-icon');
    const favoriteText = button.querySelector('.favorite-text');

    if (isFavorite) {
      button.classList.add('bg-terracota', 'text-white');
      button.classList.remove('border-terracota', 'text-terracota');
      if (favoriteText) favoriteText.textContent = 'Favoritado';
    } else {
      button.classList.remove('bg-terracota', 'text-white');
      button.classList.add('border-terracota', 'text-terracota');
      if (favoriteText) favoriteText.textContent = 'Favoritar';
    }
  }

  // Configura o botão de favoritos no header (mostra o modal)
  function setupFavoritesModal() {
    const favoritesBtn = document.getElementById('favorites-btn');
    if (favoritesBtn) {
      favoritesBtn.addEventListener('click', function() {
        const favorites = Favorites.get();
        if (favorites.length === 0) {
          alert('Você ainda não tem receitas favoritas! Clique no coração em uma receita para adicionar.');
        } else {
          // Redireciona para a página inicial com query param de favoritos
          const currentUrl = new URL(window.location.href);
          currentUrl.searchParams.set('favorites', 'true');
          window.location.href = currentUrl.toString();
        }
      });
    }
  }

  // Inicializa tudo
  updateFavoritesCount();
  setupFavoriteButton();
  setupFavoritesModal();
});
