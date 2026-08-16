	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080440E0
sub_080440E0: @ 0x080440E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov r8, r1
	ldr r0, _08044128 @ =gUnknown_03003FC0
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _0804413A
	adds r0, r6, #0
	bl sub_0804415C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804413A
	ldr r7, _0804412C @ =gUnknown_08499598
	ldr r1, [r7]
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r5, r0, #2
	adds r1, r5, r1
	ldr r4, [r1, #0x20]
	cmp r4, #0
	blt _0804413A
	add r4, r8
	adds r0, r6, #0
	bl sub_08044208
	cmp r4, r0
	ble _08044130
	adds r0, r6, #0
	bl sub_08044208
	ldr r1, [r7]
	adds r1, r5, r1
	b _08044138
	.align 2, 0
_08044128: .4byte gUnknown_03003FC0
_0804412C: .4byte gUnknown_08499598
_08044130:
	ldr r1, [r7]
	adds r1, r5, r1
	ldr r0, [r1, #0x20]
	add r0, r8
_08044138:
	str r0, [r1, #0x20]
_0804413A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

