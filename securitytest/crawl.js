#!/usr/bin/env node
'use strict';

const puppeteer = require('puppeteer');
const creds = require('./creds');

async function run() {
  const browser = await puppeteer.launch({ 
    headless: true,
    args: ['--proxy-server=localhost:8080'],
    ignoreHTTPSErrors: true 
  });


  const page = await browser.newPage();
  page.on('request', request => {
      console.log('Request url: ' + request.url());
  });

  await page.goto('https://crimdrac-jhipster-5-demo.herokuapp.com');

  await page.click('span[jhitranslate="global.menu.account.main"]');
  await page.click('span[jhitranslate="global.menu.account.login"]');

  await page.click('#username');
  await page.keyboard.type(creds.username);
  await page.click('#password');
  await page.keyboard.type(creds.password);

  await page.click('button[jhitranslate="login.form.button"]');
  await page.waitForSelector('span[jhitranslate="home.logged.message"]');
  await page.close();
  await browser.close();
}

run();
