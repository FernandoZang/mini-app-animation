# Mini-App de Interações Animadas

Este projeto demonstra um mini-app Flutter com duas telas que combinam animações sutis e recursos de imagem, de forma enxuta e focada em técnicas úteis para apps de catálogo e favoritos.

## Funcionalidades

1. **Tela de Lista de Produtos**
   - Lista vertical de cartões construídos com `ListView.builder`.
   - Cada cartão exibe:
     - Imagem do produto.
     - Nome e preço.
     - Ícone de coração para favoritar.
   - Ao tocar no cartão, ele expande (`AnimatedContainer` em 300 ms) para mostrar descrição curta.

2. **Animação de Cross-Fade de Imagem**
   - Dentro do cartão expandido, troca de imagem antes/depois com `AnimatedCrossFade` em 500 ms.
   - Botão “Ver Antes/Depois” alterna entre as imagens.

3. **Pulso no Botão de Favoritar**
   - Ícone de coração pulsa via `ScaleTransition` + `AnimationController` de 200 ms (escala de 0.8 → 1.2 → 1.0, `Curves.easeOut`).

4. **Tela de Detalhes com Loader Customizado**
   - Navegação para tela de detalhes via `Navigator.push`.
   - Loader central: ícone giratório (`AnimatedBuilder` + `AnimationController`) com 3 voltas antes de exibir o conteúdo.

## Estrutura de Arquivos

```
lib/
├── main.dart           # App principal e lista de produtos
├── model/
│   └── Product.dart    # Classe de modelo de produto
├── product_card.dart   # Cartão animado de produto
├── loading_indicator.dart  # Loader com AnimatedBuilder
└── details_screen.dart # Tela de detalhes com loader
```

## Assets

Declare no `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/camiseta_vermelha.webp
    - assets/images/camiseta_preta.webp
```

Coloque as imagens em `assets/images/`.

## Como Rodar

1. Certifique-se de ter o Flutter SDK instalado.
2. No terminal, na raiz do projeto, execute:
   ```bash
   flutter pub get
   flutter run
   ```
3. Selecione o dispositivo desejado e veja as animações em ação.

## Por que essas animações?

- **AnimatedContainer**: fácil de usar para animar tamanho, padding e cor sem gerenciar controllers.
- **AnimatedCrossFade**: ideal para trocar suavemente entre duas imagens.
- **ScaleTransition**: fornece controle fino sobre animações explícitas para feedback de toque.
- **AnimatedBuilder**: base leve para construir loaders customizados com controle total sobre o `AnimationController`.

