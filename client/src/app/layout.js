import { Inter } from "next/font/google";
import "./globals.css";
import Layout from "@/components/layout";

const inter = Inter({ subsets: ["latin"] });

export const metadata = {
  title: "BOB - Bank of Baroda",
  description: "Financial Advice",
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <Layout>
          <div>{children}</div>
        </Layout>
      </body>
    </html>
  );
}
