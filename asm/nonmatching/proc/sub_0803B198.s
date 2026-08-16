	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B198
sub_0803B198: @ 0x0803B198
	push {lr}
	ldr r0, _0803B1C4 @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0803B1B6
	movs r0, #0x71
	bl sub_0803B4DC
	ldr r0, _0803B1C8 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_0803B1B6:
	bl sub_080129E0
	bl sub_0803ABD8
	pop {r0}
	bx r0
	.align 2, 0
_0803B1C4: .4byte gUnknown_03002EE0
_0803B1C8: .4byte gUnknown_03001FBC

