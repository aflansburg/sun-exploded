

<script>
  import { useAuth0 } from "../../services/auth0";
  const { login } = useAuth0;
</script>

<button class="button button--primary button--compact" on:click={() => login()}>
  Log In
</button>