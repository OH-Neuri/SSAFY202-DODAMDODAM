import '@/styles/globals.css'
import { theme } from '@/theme/theme'
import { ThemeProvider } from '@mui/material'
import type { AppProps } from 'next/app'
import Head from 'next/head'
import { useState } from 'react'
import { QueryClientProvider, QueryClient } from 'react-query'
import { ToastContainer } from 'react-toastify'
import 'react-toastify/dist/ReactToastify.css';

declare module "react-query/types/react/QueryClientProvider" {
  interface QueryClientProviderProps {
    children?: React.ReactNode;
  }
}

export default function App({ Component, pageProps }: AppProps) {
  const [queryClient] = useState(()=> new QueryClient());
  return (
    <>
      <Head>
        <title>도담도담</title>
      </Head>
      <QueryClientProvider client={queryClient}>
        <ThemeProvider theme={theme}>
          <Component {...pageProps} />
          <ToastContainer />
        </ThemeProvider>
      </QueryClientProvider>
    </>
  )
}
