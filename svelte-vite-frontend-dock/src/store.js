import { writable, derived } from 'svelte/store';

export const isAuthenticated = writable(false);
export const user = writable({});
export const popupOpen = writable(false);
export const error = writable();

// export const scenarios = writable([]);
export const scenarios = [
  {
    scenario: {
      sun_exploded: false,
      dice: [5, 5],
    },
  },
];

export const user_scenarios = derived(
  [scenarios, user],
  ([$scenarios, $user]) => {
    let logged_in_user_scenarios = [];

    if ($user && $user.email) {
      logged_in_user_scenarios = $scenarios.filter(
        (scenario) => scenario.user === $user.email
      );
    }

    return logged_in_user_scenarios;
  }
);
