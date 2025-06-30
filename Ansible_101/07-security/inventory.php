#!/usr/bin/env php
<?php

/**
 * @file
 * Example custom dynamic inventory script for ansible, in PHP.
 */

/**
 * Example inventory for testing.
 *
 * @return array
 *   Example inventory.
 */

function example_inventory() {
  return [
    'vanish' => [
      'hosts' => [
        '172.17.0.5',
      ],
    ],
    'php' => [
      'hosts' => [
        '172.17.0.6',
      ],
    ],
    'all' => [
      'children' => [
        'vanish',
        'php',
      ],
      'vars' => [
      'ansible_user' => 'root',
      'ansible_ssh_private_key_file' => '~/.ssh/id_ed25519',
      'example_variable' => 'value',
      ],
    ],
    '_meta' => [
      'hostvars' => [
        '172.17.0.5' => [
          'vanish_host_specific_var' => 'foo',
        ],
      ],
    ],
  ];
}

/**
 * Empty inventory for testing.
 */

function empty_inventory() {
  return ['_meta' => ['hostvars' => new stdClass()]];
}

function get_inventory($argv = []) {
  $inventory = new stdClass();

  if (!empty($argv[1]) && $argv[1] == '--list') {
    $inventory = example_inventory();
  }
  elseif ((!empty($argv[1]) && $argv[1] == '--host') && !empty($argv[2])) {
    $inventory = empty_inventory();
  }

  else {
    $inventory = empty_inventory();
  }

  print json_encode($inventory);
}

get_inventory($_SERVER['argv']);
