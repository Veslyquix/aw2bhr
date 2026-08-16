	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804301C
sub_0804301C: @ 0x0804301C
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _08043040 @ =gUnknown_03003FC0
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _08043048
	ldr r2, _08043044 @ =gUnknown_085D3DD0
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r0, r4, #6
	adds r0, r0, r4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #0x40
	adds r0, r0, r2
	ldr r0, [r0]
	b _0804304A
	.align 2, 0
_08043040: .4byte gUnknown_03003FC0
_08043044: .4byte gUnknown_085D3DD0
_08043048:
	movs r0, #0
_0804304A:
	pop {r4}
	pop {r1}
	bx r1

