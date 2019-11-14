require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Question
  attr_accessor :id, :title, :body, :author 

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
       *
      FROM 
        questions 
      WHERE 
        id = ?
      SQL
    return nil unless question.length > 0 

    Question.new(question.first)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author = options['author']
  end 

end


class User
  attr_accessor :id, :fname, :lname 
  
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
       *
      FROM 
        users 
      WHERE 
        id = ?
      SQL
    return nil unless user.length > 0 

    User.new(user.first)
  end

  def self.find_by_name(fname,lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname =?  
        AND lname = ?  
      SQL
      return nil unless user.length > 0
      User.new(user.first)  

  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end 

  

end

class QuestionFollow
  attr_accessor :user_id, :question_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions_follows")
    data.map { |datum| QuestionFollow.new(datum) }
  end

  def self.find_by_user(user_id)
    follows = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
       *
      FROM 
        questions_follows 
      WHERE 
      user_id = ?
      SQL
    return nil unless follows.length > 0 

    QuestionFollow.new(follows.first)
  end

   def self.find_by_question(question_id)
    follows = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
       *
      FROM 
        questions_follows 
      WHERE 
        question_id = ?
      SQL
    return nil unless follows.length > 0 

    QuestionFollow.new(follows.first)
  end

  def initialize(options)
    @user_id = options['user_id']
    @question_id= options['question_id']
  end 

end

class Reply
  attr_accessor :id, :question_id, :parent_id, :user_id, :body

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_id(id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
       *
      FROM 
        replies 
      WHERE 
       id = ?
      SQL
    return nil unless replies.length > 0 

    Reply.new(replies.first)
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @body = options['body']
  end 

end

class QuestionLike
  attr_accessor :user_id, :question_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| QuestionLike.new(datum) }
  end

  def self.find_by_user(user_id)
    likes = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
       *
      FROM 
        question_likes
      WHERE 
      user_id = ?
      SQL
    return nil unless likes.length > 0 

    QuestionLike.new(likes.first)
  end

   def self.find_by_question(question_id)
    likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
       *
      FROM 
        question_likes 
      WHERE 
        question_id = ?
      SQL
    return nil unless likes.length > 0 

    QuestionLike.new(likes.first)
  end

  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end 

end