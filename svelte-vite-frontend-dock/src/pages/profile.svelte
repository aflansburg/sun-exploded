<script>
  import CodeSnippet from "../components/code-snippet.svelte";
  import { useAuth0 } from "../services/auth0";

  const { user, isAuthenticated } = useAuth0;

  const userinfo = $user;
</script>

{#if !($isAuthenticated && userinfo)}
  <slot />
{/if}

{#if $isAuthenticated && userinfo}
  <div class="content-layout">
    <h1 class="content__title">Profile</h1>
    <div class="content__body">
     <p>
        You can use the ID Token to get the profile information of an
        authenticated user.
        <br />
        <strong>Only authenticated users can access this page.</strong>
      </p>
      <div class="profile-grid">
        <div class="profile__header">
          <img src={userinfo.picture} alt="Profile" class="profile__avatar" />
          <div class="profile__headline">
            <h2 class="profile__title">{userinfo.name}</h2>
            <span class="profile__description">{userinfo.email}</span>
          </div>
        </div>
        <div class="profile__details">
          <CodeSnippet
            title="Decoded ID Token"
            code={JSON.stringify(userinfo, null, 2)}
          />
        </div>
      </div>
    </div>
  </div>
{/if}