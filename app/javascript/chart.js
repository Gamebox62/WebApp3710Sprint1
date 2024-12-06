import { Chart } from "chart.js";

document.addEventListener('DOMContentLoaded', () => {
  const ctx = document.getElementById('solutionsChart').getContext('2d');

  if (ctx) {
    const solutionsData = JSON.parse(ctx.dataset.solutions);
    const labelsData = JSON.parse(ctx.dataset.labels);

    new Chart(ctx, {
      type: 'bar', // You can change to other types like line, pie, etc.
      data: {
        labels: labelsData,
        datasets: [{
          label: 'Solutions',
          data: solutionsData,
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  }
});