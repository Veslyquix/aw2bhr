	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005874
sub_08005874: @ 0x08005874
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _080058B8 @ =gUnknown_03002B6C
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
	ldr r4, _080058BC @ =gUnknown_0808D7C0
	ldr r5, [r4]
	movs r0, #0
	adds r1, r5, #0
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080058C0
	movs r0, #1
	movs r1, #0
	bl sub_08004D74
	b _080058CA
	.align 2, 0
_080058B8: .4byte gUnknown_03002B6C
_080058BC: .4byte gUnknown_0808D7C0
_080058C0:
	movs r0, #1
	movs r1, #0
	adds r2, r5, #0
	bl sub_08004D90
_080058CA:
	ldr r5, [r4]
	movs r0, #1
	adds r1, r5, #0
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080058E6
	movs r0, #1
	movs r1, #1
	bl sub_08004D74
	b _080058F0
_080058E6:
	movs r0, #1
	movs r1, #1
	adds r2, r5, #0
	bl sub_08004D90
_080058F0:
	ldr r4, [r4]
	movs r0, #2
	adds r1, r4, #0
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0800590C
	movs r0, #1
	movs r1, #2
	bl sub_08004D74
	b _08005916
_0800590C:
	movs r0, #1
	movs r1, #2
	adds r2, r4, #0
	bl sub_08004D90
_08005916:
	ldr r4, _0800595C @ =gUnknown_0200B0B0
	ldr r1, [r4]
	adds r2, r1, #0
	adds r2, #0x46
	movs r5, #0
	movs r0, #0x15
	strh r0, [r2]
	adds r1, #0x48
	movs r0, #0x30
	strh r0, [r1]
	movs r0, #3
	movs r1, #2
	movs r2, #0xa
	movs r3, #4
	bl sub_0801A444
	ldr r0, _08005960 @ =gUnknown_08499578
	ldr r2, [r0]
	ldr r3, [r4]
	adds r3, #0x9c
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #4
	movs r1, #3
	bl sub_080149C0
	bl sub_08013AEC
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800595C: .4byte gUnknown_0200B0B0
_08005960: .4byte gUnknown_08499578

