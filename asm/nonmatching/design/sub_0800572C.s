	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800572C
sub_0800572C: @ 0x0800572C
	push {r4, r5, r6, lr}
	ldr r0, _08005770 @ =gUnknown_03002B6C
	ldr r1, [r0]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	movs r2, #0xbf
	lsls r2, r2, #2
	movs r0, #0
	movs r3, #0xa
	bl sub_0801F150
	movs r0, #9
	bl sub_0801F234
	ldr r4, _08005774 @ =gUnknown_0808D7B8
	ldr r5, [r4]
	movs r0, #0
	adds r1, r5, #0
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r4, #0
	cmp r0, #1
	beq _08005778
	movs r0, #0
	movs r1, #0
	bl sub_08004D74
	b _08005782
	.align 2, 0
_08005770: .4byte gUnknown_03002B6C
_08005774: .4byte gUnknown_0808D7B8
_08005778:
	movs r0, #0
	movs r1, #0
	adds r2, r5, #0
	bl sub_08004D90
_08005782:
	ldr r4, [r6]
	movs r0, #1
	adds r1, r4, #0
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0800579E
	movs r0, #0
	movs r1, #1
	bl sub_08004D74
	b _080057A8
_0800579E:
	movs r0, #0
	movs r1, #1
	adds r2, r4, #0
	bl sub_08004D90
_080057A8:
	ldr r4, [r6]
	movs r0, #2
	adds r1, r4, #0
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080057C4
	movs r0, #0
	movs r1, #2
	bl sub_08004D74
	b _080057CE
_080057C4:
	movs r0, #0
	movs r1, #2
	adds r2, r4, #0
	bl sub_08004D90
_080057CE:
	ldr r0, _080057E8 @ =gUnknown_0200B0B0
	ldr r1, [r0]
	adds r2, r1, #0
	adds r2, #0x46
	movs r0, #0x15
	strh r0, [r2]
	adds r1, #0x48
	movs r0, #0x20
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080057E8: .4byte gUnknown_0200B0B0

