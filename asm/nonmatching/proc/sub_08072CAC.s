	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072CAC
sub_08072CAC: @ 0x08072CAC
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x64]
	cmp r0, #0
	bge _08072CDE
	movs r3, #0
	ldr r0, [r2, #0x58]
	cmp r3, r0
	bge _08072CD6
	adds r4, r2, #0
	adds r4, #0x46
	adds r1, r2, #0
	adds r1, #0x2a
_08072CC6:
	adds r0, r4, r3
	ldrb r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	ldr r0, [r2, #0x58]
	cmp r3, r0
	blt _08072CC6
_08072CD6:
	adds r0, r2, #0
	movs r1, #0
	bl Proc_Goto
_08072CDE:
	pop {r4}
	pop {r0}
	bx r0

