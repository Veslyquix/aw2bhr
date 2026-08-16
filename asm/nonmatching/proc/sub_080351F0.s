	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080351F0
sub_080351F0: @ 0x080351F0
	push {r4, r5, lr}
	ldr r4, _0803521C @ =gUnknown_03003FC0
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	bl sub_08035124
	adds r4, #0x2c
	ldrb r0, [r4]
	ldrb r1, [r5]
	cmp r0, r1
	beq _08035214
	ldr r0, _08035220 @ =gUnknown_0849BD38
	movs r1, #0
	bl sub_080152EC
	ldrb r1, [r5]
	strh r1, [r0, #0x20]
_08035214:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803521C: .4byte gUnknown_03003FC0
_08035220: .4byte gUnknown_0849BD38

