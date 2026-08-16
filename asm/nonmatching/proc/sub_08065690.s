	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065690
sub_08065690: @ 0x08065690
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x34]
	ldr r0, [r4, #0x38]
	adds r1, r1, r0
	str r1, [r4, #0x34]
	ldr r0, [r4, #0x24]
	adds r0, r0, r1
	str r0, [r4, #0x24]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	ldr r1, [r4, #0x28]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, [r4, #0x3c]
	movs r3, #0
	bl sub_0801BD00
	ldr r0, [r4, #0x24]
	adds r0, #0x30
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	bls _080656D4
	ldr r0, _080656DC @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_080656D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080656DC: .4byte gUnknown_03001FBC

