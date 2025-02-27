# Podcast Feed Generator

A GitHub Action to generate a podcast feed from a YAML file. YAML is easier to read and write compared to XML, and this action will convert your YAML file into a valid podcast feed.

---

## Usage

### 1. Turn on GitHub Pages

In your repository, go to **Settings** > **Pages** and select the `main` branch as the source. This will create a link to your page and provide all of the content in the `main` branch with a URL. Note the URL for the next step.

### 2. Create a YAML file

Create a YAML file in your repository with the following format:

```yaml
title: <Podcast Title>
subtitle: <Podcast Subtitle>
author: <Author Name>
description: <Podcast Description>
link: <GitHub Pages URL>
image: <Artwork Location>
language: <Podcast Language (e.g., en-us)>
category: <Podcast Category (e.g., Technology)>
format: <File Format (e.g., audio/mpeg)>
item:
  - title: <Podcast Episode Title>
    description: <Podcast Episode Description>
    published: <Date Published (e.g., Thu, 12 Jan 2023 18:00:00 GMT)>
    file: <Filename (e.g., /audio/TFIT01.mp3)>
    duration: <Duration (e.g., 00:00:36)>
    length: <Length (e.g., 576324, size of file in bytes)>
```
### 3. Sample Workflow

Create a GitHub Actions workflow file (e.g., .github/workflows/generate-feed.yml) with the following content:

```yaml
name: Generate Feed

on: [push]

jobs:
  generate-feed:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repo
        uses: actions/checkout@v3
      
      - name: Run Feed Generator
        uses: planetoftheweb/podcast-feed-generator@main
```

### 4. Commit and Push

After setting up the YAML file and workflow, commit the changes to your repository. The action will run every time you push to the repository, generating a valid podcast feed.
---

## License
This project is licensed under the MIT License - see the LICENSE file for details.

