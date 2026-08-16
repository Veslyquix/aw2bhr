	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806044C
sub_0806044C: @ 0x0806044C
	push {lr}
	ldr r1, _08060468 @ =gUnknown_030046C0
	ldrb r0, [r1, #6]
	ldrb r1, [r1, #7]
	bl sub_08042634
	ldr r1, _0806046C @ =gUnknown_03004780
	movs r0, #2
	strh r0, [r1]
	ldr r1, _08060470 @ =gUnknown_030045D4
	movs r0, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08060468: .4byte gUnknown_030046C0
_0806046C: .4byte gUnknown_03004780
_08060470: .4byte gUnknown_030045D4

