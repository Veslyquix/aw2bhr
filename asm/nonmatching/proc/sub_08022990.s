	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08022990
sub_08022990: @ 0x08022990
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	bl sub_08013C00
	movs r5, #0
	ldr r7, _080229FC @ =gUnknown_080909B4
_080229A4:
	movs r4, #0
	adds r6, r5, #1
_080229A8:
	ldr r0, [r7]
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	adds r1, r5, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_080227F4
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xf
	bls _080229A8
	lsls r0, r6, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xa
	bls _080229A4
	bl sub_08013AEC
	ldr r1, _08022A00 @ =gUnknown_03000559
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08022A04 @ =gUnknown_08499B4C
	movs r1, #0xff
	bl sub_080152EC
	mov r1, r8
	strh r1, [r0, #0x1e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080229FC: .4byte gUnknown_080909B4
_08022A00: .4byte gUnknown_03000559
_08022A04: .4byte gUnknown_08499B4C

