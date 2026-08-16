	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080637AC
sub_080637AC: @ 0x080637AC
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0x1d
	ldr r0, _080637C4 @ =gUnknown_03001470
	movs r4, #0xae
	lsls r4, r4, #4
	adds r1, r0, r4
_080637BA:
	ldr r0, [r1]
	cmp r0, r3
	bne _080637C8
	adds r0, r1, #0
	b _080637D2
	.align 2, 0
_080637C4: .4byte gUnknown_03001470
_080637C8:
	subs r1, #0x60
	subs r2, #1
	cmp r2, #0
	bge _080637BA
	movs r0, #0
_080637D2:
	pop {r4}
	pop {r1}
	bx r1

