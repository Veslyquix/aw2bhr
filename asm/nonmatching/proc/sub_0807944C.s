	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807944C
sub_0807944C: @ 0x0807944C
	push {lr}
	bl sub_0807A908
	ldr r1, _0807946C @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1d]
	movs r1, #0
	movs r2, #0xb
	bl sub_08043BA4
	pop {r0}
	bx r0
	.align 2, 0
_0807946C: .4byte gUnknown_08499598

