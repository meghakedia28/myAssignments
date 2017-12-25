SELECT [userAnswer] FROM [score] JOIN [quizQuestion] 
ON [score].[quizQuestionId] = [quizQuestion].[quizQuestionId]
WHERE [score].[userId] = '10042' AND [quizQuestion].[quizId] = '50' 