	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013C54
sub_08013C54: @ 0x08013C54
	push {r4, r5, lr}
	movs r2, #0
	ldr r5, _08013C9C @ =gUnknown_0849957C
	movs r4, #0
	ldr r3, _08013CA0 @ =0x000003FF
_08013C5E:
	ldr r0, [r5]
	lsls r1, r2, #1
	adds r1, r1, r0
	strh r4, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	bls _08013C5E
	movs r2, #0
	ldr r5, _08013CA4 @ =gUnknown_03001FE8
	movs r4, #0xc0
	lsls r4, r4, #0x13
	movs r3, #0
_08013C7A:
	ldr r0, [r5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	lsls r1, r2, #1
	adds r0, r0, r1
	adds r0, r0, r4
	strh r3, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xf
	bls _08013C7A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013C9C: .4byte gUnknown_0849957C
_08013CA0: .4byte 0x000003FF
_08013CA4: .4byte gUnknown_03001FE8

