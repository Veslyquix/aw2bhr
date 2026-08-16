	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806AF44
sub_0806AF44: @ 0x0806AF44
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, _0806AF64 @ =gUnknown_085C77A0
	ldr r1, _0806AF68 @ =gUnknown_0202F214
	ldrh r0, [r5, #0x2a]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r4, [r0, #0x16]
	cmp r4, #0
	bne _0806AF6C
	movs r0, #0
	b _0806AFE0
	.align 2, 0
_0806AF64: .4byte gUnknown_085C77A0
_0806AF68: .4byte gUnknown_0202F214
_0806AF6C:
	subs r4, #1
	ldr r0, _0806AFAC @ =gUnknown_085818F4
	adds r1, r5, #0
	bl Proc_Start
	adds r2, r0, #0
	str r4, [r2, #0x2c]
	ldrh r0, [r5, #0x2c]
	movs r3, #1
	ands r3, r0
	cmp r3, #0
	bne _0806AFB8
	ldr r0, _0806AFB0 @ =gUnknown_0300251C
	ldr r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	str r0, [r2, #0x30]
	ldr r0, _0806AFB4 @ =gUnknown_08499584
	ldr r0, [r0]
	str r0, [r2, #0x34]
	adds r0, r2, #0
	adds r0, #0x38
	strb r3, [r0]
	adds r1, r2, #0
	adds r1, #0x39
	movs r0, #3
	b _0806AFDC
	.align 2, 0
_0806AFAC: .4byte gUnknown_085818F4
_0806AFB0: .4byte gUnknown_0300251C
_0806AFB4: .4byte gUnknown_08499584
_0806AFB8:
	ldr r0, _0806AFE8 @ =gUnknown_03001FE8
	ldr r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	str r0, [r2, #0x30]
	ldr r0, _0806AFEC @ =gUnknown_0849957C
	ldr r0, [r0]
	str r0, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x38
	movs r0, #7
	strb r0, [r1]
	adds r1, #1
	movs r0, #1
_0806AFDC:
	strb r0, [r1]
	movs r0, #1
_0806AFE0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806AFE8: .4byte gUnknown_03001FE8
_0806AFEC: .4byte gUnknown_0849957C

