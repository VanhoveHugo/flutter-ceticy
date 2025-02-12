class Poll {
  final int id;
  final String name;
  final int creatorId;
  final List<PollOption> options;
  final List<PollParticipant> participants;
  final List<PollVote> votes;

  Poll(
    this.id,
    this.name,
    this.creatorId,
    this.options,
    this.participants,
    this.votes,
  );

  factory Poll.fromJson(Map<String, dynamic> json) {
    return Poll(
      json['id'],
      json['name'],
      json['creatorId'],
      (json['options'] as List<dynamic>? ?? [])
          .map((option) => PollOption.fromJson(option))
          .toList(),
      (json['participants'] as List<dynamic>? ?? [])
          .map((participant) => PollParticipant.fromJson(participant))
          .toList(),
      (json['votes'] as List<dynamic>? ?? [])
          .map((vote) => PollVote.fromJson(vote))
          .toList(),
    );
  }
}

class PollOption {
  final int id;
  final int pollId;
  final int restaurantId;

  PollOption(
    this.id,
    this.pollId,
    this.restaurantId,
  );

  factory PollOption.fromJson(Map<String, dynamic> json) {
    return PollOption(
      json['id'],
      json['pollId'],
      json['restaurantId'],
    );
  }
}

class PollParticipant {
  final int id;
  final int pollId;
  final int userId;

  PollParticipant(
    this.id,
    this.pollId,
    this.userId,
  );

  factory PollParticipant.fromJson(Map<String, dynamic> json) {
    return PollParticipant(
      json['id'],
      json['pollId'],
      json['userId'],
    );
  }
}

class PollVote {
  final int id;
  final int pollId;
  final int userId;
  final int optionId;
  final int vote;

  PollVote(
    this.id,
    this.pollId,
    this.userId,
    this.optionId,
    this.vote,
  );

  factory PollVote.fromJson(Map<String, dynamic> json) {
    return PollVote(
      json['id'],
      json['pollId'],
      json['userId'],
      json['optionId'],
      json['vote'],
    );
  }
}
