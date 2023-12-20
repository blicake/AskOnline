let usernames = [];

let currentUsername = "";

function addUsername() {
  const usernameInput = document.getElementById('usernameInput');
  const username = usernameInput.value;

  if (username) {
    currentUsername = username;
    document.getElementById('displayedUsername').innerText = `Logged in as: ${username}`; // Display the username
    usernameInput.value = '';
  }
}


function addQuestion() {
  const questionInput = document.getElementById('questionInput');
  const questionText = questionInput.value;
  
  if (currentUsername && questionText) {
    const questionList = document.getElementById('questionList');
    const listItem = document.createElement('li');
    listItem.innerText = `${currentUsername}: ${questionText}`; // Connect the question to the current username
    listItem.addEventListener('click', viewAnswers);
    questionList.appendChild(listItem);
    questionInput.value = '';
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