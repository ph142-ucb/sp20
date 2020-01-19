---
layout: home
title: Home
nav_order: 0
description: >-
    Just the Class is a modern, highly customizable, responsive Jekyll theme
    for developing course websites.
---

# Introduction to Probability and Statistics in Biology and Public Health
{: .mb-2 }
PH 142, Spring 2020
{: .mb-0 .fs-6 .text-grey-dk-000 }

{% assign instructors = site.staffers | where: 'role', 'Instructor' %}
<div class="role">
  {% for staffer in instructors %}
  {{ staffer }}
  {% endfor %}
</div>

{% if site.announcements %}
We will not be updating this page with announcements. For the latest announcements, make sure to check our [Piazza](piazza.com/berkeley/spring2020/ph142).
{% endif %}

## Important Information

- When: Mondays, Wednesdays, & Fridays, 8:10am-9:00am
- Where: 245 Li Ka Shing
- What: See the [schedule](course-schedule)
- Course number: 28928

## Goals

- Build strong foundations in statistics and introduce students to programming to prepare students for more advanced courses involving data analysis.
- Foster a mindset of statistical thinking to give students the tools to understand experiments and research studies and evaluate their validity.
- Empower students to address real-world problems with technical prowess.

## Course Description

This course is an introduction to statistics and data science, primarily for MPH and undergraduate public health majors, and others interested in public health topics. The course can be divided into three parts: 

- **Part I:** We will be focusing on learning to explore and summarize univariate and bivariate distributions. We will be using the R statistical software to do this, specifically, we will use the dplyr and ggplot2 packages. 
- **Part II:** We will be learning about classical problems in probability and the some commonly used probability distributions: the Normal, Binomial, and Poisson distributions. In Part II we will also make the link between theoretical distributions and sampled distributions and cover a key concept called the Central Limit Theorem. 
- **Part III:** We introduce statistical inference, the process of estimating statistics from samples to make inference about populations. 

Throughout the course, we will follow the **PPDAC model**, which stands for “Problem, Plan, Data, Analysis, and Conclusion”. 
