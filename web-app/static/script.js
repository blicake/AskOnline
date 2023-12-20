currentUsername = ''

function addUsername() {
  const usernameInput = document.getElementById('usernameInput');
  const username = usernameInput.value;

  if (username) {
    fetch(`/add-username/${username}`, {
      method: 'POST'
    })
      .then(response => response.json())
      .then(data => {
        document.getElementById('displayedUsername').innerText = `Logged in as: ${username}`;
        usernameInput.value = '';
        currentUsername = `${username}`;
      });
  }
}

async function addQuestion() {
  const questionInput = document.getElementById('questionInput');
  const questionText = questionInput.value;
  console.debug(usernameInput);
  const url = '/add-question';
  const data = {
    username: currentUsername,
    question: questionText
  };
  console.debug(data);
  const response = await fetch(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)
  });

  if (response.ok) {
    const questionList = document.getElementById('questionList');
    const listItem = document.createElement('li');
    listItem.innerText = `${currentUsername}: ${questionText}`;
    listItem.addEventListener('click', viewAnswers);
    questionList.appendChild(listItem);
    questionInput.value = '';
  } else {
    console.error('Failed to add question:', response.statusText);
  }
}

function getQuestions() {
  fetch('/get-questions')
    .then(response => response.json())
    .then(data => {
      if (data && data.questions) {
        const questions = data.questions;
        const questionList = document.getElementById('questionList');
        questionList.innerHTML = '';
        questions.forEach(({ username, question }) => {
          const listItem = document.createElement('li');
          listItem.innerText = `${username}: ${question}`;
          listItem.addEventListener('click', viewAnswers);
          questionList.appendChild(listItem);
        });
      }
    });
}

function viewAnswers(event) {
  const question = event.target.innerText;
  const username = question.split(':')[0].trim();
  const questionText = question.split(':')[1].trim();
  const answers = prompt(`Answers for "${questionText}" by ${username}:`);
  if (answers) {
    // Handle answers, e.g., send to backend
  }
}

document.getElementById('questionList').addEventListener('click', viewAnswers);

getQuestions();
