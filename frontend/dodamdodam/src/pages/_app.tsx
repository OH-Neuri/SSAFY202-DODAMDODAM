import '@/styles/globals.css'
import { theme } from '@/theme/theme'
import { ThemeProvider } from '@mui/material'
import type { AppProps } from 'next/app'
import Head from 'next/head'
import { ToastContainer } from 'react-toastify'
import 'react-toastify/dist/ReactToastify.css';

export default function App({ Component, pageProps }: AppProps) {
  return (
    <>
      <Head>
        <title>도담도담</title>
      </Head>
      <ThemeProvider theme={theme}>
        <Component {...pageProps} />
        <ToastContainer />
      </ThemeProvider>
    </>
  )
}
