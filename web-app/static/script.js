let usernames = [];

function addUsername() {
  const usernameInput = document.getElementById('usernameInput');
  const username = usernameInput.value;

  if (username && !usernames.includes(username)) {
    usernames.push(username);
    usernameInput.value = '';
  }
}

function addQuestion() {
  const input = document.getElementById('questionInput');
  const questionList = document.getElementById('questionList');
  const questionText = input.value;
  input.value = '';

  if (questionText) {
    const listItem = document.createElement('li');
    listItem.innerText = questionText;
    questionList.appendChild(listItem);
  }
}

function viewAnswers(event) {
  const question = event.target.innerText;
  const answers = prompt(`Answers for "${question}":`);
  if (answers) {
    alert(answers);
  }
}

document.getElementById('questionList').addEventListener('click', function(event) {
  if (event.target.tagName === 'LI') {
    viewAnswers(event);
  }
});