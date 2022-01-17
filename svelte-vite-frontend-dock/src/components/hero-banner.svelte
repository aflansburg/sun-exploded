<script>
  let gifState = 'static';

  let gifProps = {
    static: {
      src: "../images/static-supernova.png"
    },
    animated: {
      src: "https://media.giphy.com/media/rn79UlSTDfDlS/giphy.gif"
    }
  }

  const updateSupernova = () => {
    gifState = gifState == 'static' ? 'animated' : 'static';
  }
</script>

<div class="hero-banner">
    <img
      class="hero-banner__logo"
      id="supernova_gif"
      src={gifProps[gifState].src}
      alt="A star going supernova"
      on:click={updateSupernova}
    />
  <h1 class="hero-banner__headline">Sun Exploded?</h1>
  <p class="hero-banner__description">
    Something mildly interesting coming soon.
  </p>
  <img
    src="https://imgs.xkcd.com/comics/frequentists_vs_bayesians.png"
    alt="A funny XKCD cartoon"
  />

  <!-- <button on:click={openCodeSample} class="button button--secondary">
    Check out the code sample →
  </button> -->
</div>