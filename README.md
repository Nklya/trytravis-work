# mailhog ansible role

[![Build Status](https://img.shields.io/travis/cndies/ansible-role-mailhog.svg)](https://travis-ci.com/cndies/ansible-role-mailhog)
[![Galaxy](https://img.shields.io/badge/galaxy-cndies.mailhog-blue.svg)](https://galaxy.ansible.com/cndies/mailhog)
[![GitHub Tags](https://img.shields.io/github/tag/cndies/ansible-role-mailhog.svg)](https://github.com/cndies/ansible-role-mailhog)
[![GitHub Stars](https://img.shields.io/github/stars/cndies/ansible-role-mailhog.svg)](https://github.com/cndies/ansible-role-mailhog)

Install & config MailHog

## Requirements

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here.

## Role Variables

Please look at `defaults/main.yml`, `vars/main.yml`

## Dependencies

- None

## Example Playbook

```yaml
    - hosts: servers
      roles:
         - mailhog
```

## License

MIT

## Author Information

Nikolay Antsiferov, Cndies
