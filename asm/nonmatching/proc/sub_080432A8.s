	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080432A8
sub_080432A8: @ 0x080432A8
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _080432D0 @ =gUnknown_03003FC0
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _080432D8
	ldr r2, _080432D4 @ =gUnknown_085D3DD0
	lsls r1, r3, #4
	adds r1, r1, r3
	lsls r0, r4, #6
	adds r0, r0, r4
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _080432DA
	.align 2, 0
_080432D0: .4byte gUnknown_03003FC0
_080432D4: .4byte gUnknown_085D3DD0
_080432D8:
	movs r0, #0
_080432DA:
	pop {r4}
	pop {r1}
	bx r1

