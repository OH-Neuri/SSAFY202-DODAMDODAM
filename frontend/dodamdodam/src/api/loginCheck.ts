import router from "next/router";

export const loginCheck = () => {
  const token =
    typeof window !== "undefined" ? sessionStorage.getItem("token") : null;
  if (token == null) {
    return false;
  } else {
    return true;
  }
};
