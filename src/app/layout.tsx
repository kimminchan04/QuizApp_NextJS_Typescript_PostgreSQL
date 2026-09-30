import type { Metadata } from "next";
import "./globals.css";
import localFont from "next/font/local"

export const metadata: Metadata = {
  title: "Quiz App",
  description: "Try to match correct word",
};

const notoSansKR = localFont({
  src: "../fonts/NotoSansKR-VariableFont_wght.ttf",
  weight: "100 900",
  display: "swap"
});

export default function RootLayout({ children }: LayoutProps<"/">) {
  return (
    <html lang="ko" className={notoSansKR.className}>
      <body>{children}</body>
    </html>
  );
}
